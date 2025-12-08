<?php
namespace MyModule\Service;

class OmekaDataExporter
{
    protected $api;

    public function __construct($api)
    {
        $this->api = $api;
    }

    /**
     * Export an Omeka item as a document for AnythingLLM
     *
     * @param \Omeka\Api\Representation\ItemRepresentation $item
     * @param string $resourceType The resource class (Recipe, Ingredient, etc.)
     * @return array|null Document with 'title' and 'content' keys
     */
    public function exportItemAsDocument($item, $resourceType)
    {
        $originalTitle = $item->displayTitle() ?: 'Untitled';
        $itemId = $item->id();
        $data = [];

        // Add basic metadata
        $data['id'] = $itemId;
        $data['type'] = $resourceType;
        $data['url'] = $item->apiUrl();
        
        // Create reference ID
        $data['reference'] = sprintf('%s-%d', strtoupper($resourceType), $itemId);

        // Extract all property values
        $values = $item->values();
        foreach ($values as $term => $property) {
            $propertyValues = [];
            foreach ($property['values'] as $value) {
                $val = $value->value();
                if ($val) {
                    $propertyValues[] = $val;
                }
            }
            if (!empty($propertyValues)) {
                $data[$term] = count($propertyValues) === 1 ? $propertyValues[0] : $propertyValues;
            }
        }

        // Build content based on resource type
        $content = $this->buildContent($resourceType, $originalTitle, $data);

        if (empty($content)) {
            return null;
        }

        // Create enhanced title with [TYPE-ID] prefix
        $enhancedTitle = sprintf('[%s-%d] %s', strtoupper($resourceType), $itemId, $originalTitle);

        return [
            'title' => $enhancedTitle,
            'content' => $content,
        ];
    }

    /**
     * Build document content based on resource type
     *
     * @param string $resourceType
     * @param string $title
     * @param array $data
     * @return string
     */
    protected function buildContent($resourceType, $title, $data)
    {
        switch ($resourceType) {
            case 'Recipe':
                return $this->buildRecipeContent($title, $data);
            case 'Ingredient':
                return $this->buildIngredientContent($title, $data);
            case 'User':
                return $this->buildUserContent($title, $data);
            default:
                return $this->buildGenericContent($title, $data);
        }
    }

    /**
     * Build recipe document content
     */
    protected function buildRecipeContent($title, $data)
    {
        $json = [
            '@type' => 'Recipe',
            'name' => $title,
        ];

        // Map Kitchen Exchange properties
        $propertyMap = [
            'https://github.com/ihabChaker/KitchenExchange#description' => 'description',
            'https://github.com/ihabChaker/KitchenExchange#steps' => 'steps',
            'https://github.com/ihabChaker/KitchenExchange#cookingTime' => 'cookingTime',
            'https://github.com/ihabChaker/KitchenExchange#preparationTime' => 'preparationTime',
            'https://github.com/ihabChaker/KitchenExchange#calories' => 'calories',
            'https://github.com/ihabChaker/KitchenExchange#difficulty' => 'difficulty',
            'https://github.com/ihabChaker/KitchenExchange#hasIngredient' => 'ingredients',
        ];

        foreach ($propertyMap as $uri => $key) {
            if (isset($data[$uri])) {
                $json[$key] = $data[$uri];
            }
        }

        // Build human-readable text with reference header
        $text = "---\n";
        $text .= "**REFERENCE:** {$data['reference']}\n";
        $text .= "**TYPE:** Recipe\n";
        $text .= "**OMEKA ID:** {$data['id']}\n";
        $text .= "**URL:** {$data['url']}\n";
        $text .= "---\n\n";
        
        $text .= "# Recipe: $title\n\n";

        if (isset($json['description'])) {
            $text .= "## Description\n{$json['description']}\n\n";
        }

        if (isset($json['difficulty'])) {
            $text .= "**Difficulty:** {$json['difficulty']}\n";
        }

        if (isset($json['preparationTime'])) {
            $text .= "**Preparation Time:** {$json['preparationTime']}\n";
        }

        if (isset($json['cookingTime'])) {
            $text .= "**Cooking Time:** {$json['cookingTime']}\n";
        }

        if (isset($json['calories'])) {
            $text .= "**Calories:** {$json['calories']}\n";
        }

        $text .= "\n";

        if (isset($json['ingredients'])) {
            $text .= "## Ingredients\n";
            $ingredients = is_array($json['ingredients']) ? $json['ingredients'] : [$json['ingredients']];
            foreach ($ingredients as $ingredient) {
                $text .= "- $ingredient\n";
            }
            $text .= "\n";
        }

        if (isset($json['steps'])) {
            $text .= "## Instructions\n{$json['steps']}\n\n";
        }

        // Add JSON metadata at the end
        $text .= "---\n";
        $text .= "**Metadata (JSON):**\n";
        $text .= "```json\n" . json_encode($json, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n```\n";

        return $text;
    }

    /**
     * Build ingredient document content
     */
    protected function buildIngredientContent($title, $data)
    {
        $json = [
            '@type' => 'Ingredient',
            'name' => $title,
        ];

        $propertyMap = [
            'https://github.com/ihabChaker/KitchenExchange#description' => 'description',
            'https://github.com/ihabChaker/KitchenExchange#nutritionalInfo' => 'nutritionalInfo',
            'https://github.com/ihabChaker/KitchenExchange#isHealthy' => 'isHealthy',
        ];

        foreach ($propertyMap as $uri => $key) {
            if (isset($data[$uri])) {
                $json[$key] = $data[$uri];
            }
        }

        $text = "---\n";
        $text .= "**REFERENCE:** {$data['reference']}\n";
        $text .= "**TYPE:** Ingredient\n";
        $text .= "**OMEKA ID:** {$data['id']}\n";
        $text .= "**URL:** {$data['url']}\n";
        $text .= "---\n\n";
        
        $text .= "# Ingredient: $title\n\n";

        if (isset($json['description'])) {
            $text .= "{$json['description']}\n\n";
        }

        if (isset($json['nutritionalInfo'])) {
            $text .= "## Nutritional Information\n{$json['nutritionalInfo']}\n\n";
        }

        if (isset($json['isHealthy'])) {
            $healthy = $json['isHealthy'] ? 'Yes' : 'No';
            $text .= "**Healthy:** $healthy\n\n";
        }

        $text .= "---\n";
        $text .= "**Metadata (JSON):**\n";
        $text .= "```json\n" . json_encode($json, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n```\n";

        return $text;
    }

    /**
     * Build user document content
     */
    protected function buildUserContent($title, $data)
    {
        $json = [
            '@type' => 'User',
            'name' => $title,
        ];

        $propertyMap = [
            'https://github.com/ihabChaker/KitchenExchange#firstName' => 'firstName',
            'https://github.com/ihabChaker/KitchenExchange#lastName' => 'lastName',
            'https://github.com/ihabChaker/KitchenExchange#email' => 'email',
        ];

        foreach ($propertyMap as $uri => $key) {
            if (isset($data[$uri])) {
                $json[$key] = $data[$uri];
            }
        }

        $text = "---\n";
        $text .= "**REFERENCE:** {$data['reference']}\n";
        $text .= "**TYPE:** User\n";
        $text .= "**OMEKA ID:** {$data['id']}\n";
        $text .= "**URL:** {$data['url']}\n";
        $text .= "---\n\n";
        
        $text .= "# User: $title\n\n";

        if (isset($json['firstName']) && isset($json['lastName'])) {
            $text .= "**Name:** {$json['firstName']} {$json['lastName']}\n";
        }

        if (isset($json['email'])) {
            $text .= "**Email:** {$json['email']}\n";
        }

        $text .= "\n---\n";
        $text .= "**Metadata (JSON):**\n";
        $text .= "```json\n" . json_encode($json, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n```\n";

        return $text;
    }

    /**
     * Build generic document content for unknown types
     */
    protected function buildGenericContent($title, $data)
    {
        $text = "# $title\n\n";

        foreach ($data as $key => $value) {
            if ($key === 'id' || $key === 'type' || $key === 'url') {
                continue;
            }

            $label = $this->formatPropertyLabel($key);
            $valueStr = is_array($value) ? implode(', ', $value) : $value;
            $text .= "**$label:** $valueStr\n";
        }

        $text .= "\n---\n";
        $text .= "**Metadata (JSON):**\n";
        $text .= "```json\n" . json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n```\n";

        return $text;
    }

    /**
     * Format property URI to readable label
     */
    protected function formatPropertyLabel($uri)
    {
        // Extract term from URI
        if (preg_match('/#(.+)$/', $uri, $matches)) {
            $term = $matches[1];
        } elseif (preg_match('/\/([^\/]+)$/', $uri, $matches)) {
            $term = $matches[1];
        } else {
            $term = $uri;
        }

        // Convert camelCase to Title Case
        $term = preg_replace('/([a-z])([A-Z])/', '$1 $2', $term);
        return ucwords($term);
    }
}
