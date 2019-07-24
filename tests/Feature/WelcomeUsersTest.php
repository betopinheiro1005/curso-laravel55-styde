<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class WelcomeUsersTest extends TestCase
{
    /** @test */
    function it_welcomes_users_with_nickname()
    {
        $this->get('saudar/roberto/beto')
            ->assertStatus(200)
            ->assertSee('Bem-vindo Roberto, teu apelido é Beto');
    }

    /** @test */
    function it_welcomes_users_without_nickname()
    {
        $this->get('saudar/Roberto')
            ->assertStatus(200)
            ->assertSee('Bem-vindo Roberto');
    }
}
