<?php

declare(strict_types=1);

use DocAxess\Apify\Dataset\Option\FormatType;
use Pest\Expectation;

it('should return the default format type', fn (): Expectation => expect(FormatType::default())->toBe(FormatType::JSON));

it('should create from string', function (string $name, FormatType $expected): void {
    $formatType = FormatType::fromString($name);
    expect($formatType->is($expected))->toBeTrue();
})->with([
    ['json', FormatType::JSON],
    ['jsonl', FormatType::JSONL],
    ['csv', FormatType::CSV],
    ['xml', FormatType::XML],
    ['html', FormatType::HTML],
    ['xlsx', FormatType::XLSX],
    ['rss', FormatType::RSS],
]);

it('should throw an exception for unknown format type', function (): void {
    FormatType::fromString('unknown');
})->throws(InvalidArgumentException::class, 'Unknown format type: unknown');
