<?php
declare(strict_types=1);

namespace FooTest\Bar;

use Foo\Bar\Example;
use PHPUnit\Framework\TestCase;

/**
 * FooBar Example Test
 */
class ExampleTest extends TestCase
{
    protected function setUp()
    {
        $this->example = new Example();
    }

    public function testBazQux()
    {
        $this->assertNull($this->example->getBazQux());
        $this->assertNull($this->example->setBazQux('OneTwo'));
        $this->assertSame('OneTwo', $this->example->getBazQux());
        $this->assertNull($this->example->setBazQux(null));
        $this->assertNull($this->example->getBazQux());
    }
}
