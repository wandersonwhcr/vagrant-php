<?php

namespace Foo\Bar;

/**
 * FooBar Example
 */
class Example
{
    /**
     * BazQux
     * @type string
     */
    private $bazQux;

    /**
     * Constructor
     *
     * @param string $bazQux BazQux
     */
    public function __construct(string $bazQux = null)
    {
        $this->setBazQux($bazQux);
    }

    /**
     * Set BazQux
     *
     * @param  string|null $bazQux BazQux
     * @return void
     */
    public function setBazQux(?string $bazQux) : void
    {
        $this->bazQux = $bazQux;
    }

    /**
     * Get BazQux
     *
     * @return string BazQux
     */
    public function getBazQux() : ?string
    {
        return $this->bazQux;
    }
}
