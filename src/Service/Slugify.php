<?php


namespace App\Service;

/**
 * Class Slugify
 * @package App\Service
 */
class Slugify
{
    public function generate(string $input)
    {
        $slug = preg_replace(
            ' ',
            '-', $input
        );
        return $slug;
    }

}
