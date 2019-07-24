<?php

namespace Tests\Feature;

use App\User;
use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class UsersModuleTest extends TestCase
{

    use RefreshDatabase;

    /** @test */
    function it_shows_the_users_list()
    {

        factory(User::class)->create([
            'name' => 'Joel'
        ]);

        factory(User::class)->create([
            'name' => 'Ellie',
        ]);

        $this->get('/usuarios')
            ->assertStatus(200)
            ->assertSee('Lista de usuários')
            ->assertSee('Joel')
            ->assertSee('Ellie');
    }

    /** @test */
    function it_shows_a_default_message_if_the_users_list_is_empty()
    {
        $this->get('/usuarios')
            ->assertStatus(200)
            ->assertSee('Não há usuários registrados.');
    }

    /** @test */
    function it_displays_the_users_details()
    {
        $user = factory(User::class)->create([
            'name' => 'Duilio Palacios'
        ]);

        $this->get('/usuarios/'.$user->id) // usuarios/5
        ->assertStatus(200)
            ->assertSee('Duilio Palacios');
    }

    /** @test */
    function it_displays_a_404_error_if_the_user_is_not_found()
    {
        $this->get('/usuarios/999')
            ->assertStatus(404)
            ->assertSee('Página não encontrada!');
    }

    /** @test */
    function it_loads_the_new_users_page()
    {
        $this->get('/usuarios/novo')
            ->assertStatus(200)
            ->assertSee('Criar usuário');
    }

    /** @test */
    function it_creates_a_new_user()
    {
        $this->withoutExceptionHandling();
        $this->post('/usuarios/', [
            'name' => 'Duilio',
            'email' => 'duilio@styde.net',
            'password' => '123456'
        ])->assertRedirect('usuarios');
        $this->assertCredentials([
            'name' => 'Duilio',
            'email' => 'duilio@styde.net',
            'password' => '123456',
        ]);
    }

    /** @test */
    function the_name_is_required()
    {
        $this->from('usuarios/novo')
            ->post('/usuarios/', [
                'name' => '',
                'email' => 'duilio@styde.net',
                'password' => '123456'
            ])
            ->assertRedirect('usuarios/novo')
            ->assertSessionHasErrors(['name' => 'O campo nome é obrigatório']);
        $this->assertEquals(0, User::count());
//        $this->assertDatabaseMissing('users', [
//            'email' => 'duilio@styde.net',
//        ]);
    }

    /** @test */
    function the_email_is_required()
    {
        $this->from('usuarios/novo')
            ->post('/usuarios/', [
                'name' => 'Duilio',
                'email' => '',
                'password' => '123456'
            ])
            ->assertRedirect('usuarios/novo')
            ->assertSessionHasErrors(['email' => 'O campo email é obrigatório']);
        $this->assertEquals(0, User::count());
    }

    /** @test */
    function the_email_must_be_valid()
    {
        $this->from('usuarios/novo')
            ->post('/usuarios/', [
                'name' => 'Duilio',
                'email' => 'correo-no-valido',
                'password' => '123456'
            ])
            ->assertRedirect('usuarios/novo')
            ->assertSessionHasErrors(['email' => 'O email é inválido']);
        $this->assertEquals(0, User::count());
    }

    /** @test */
    function the_email_must_be_unique()
    {
        factory(User::class)->create([
            'email' => 'duilio@styde.net'
        ]);
        $this->from('usuarios/novo')
            ->post('/usuarios/', [
                'name' => 'Duilio',
                'email' => 'duilio@styde.net',
                'password' => '123456'
            ])
            ->assertRedirect('usuarios/novo')
            ->assertSessionHasErrors(['email' => 'O email deve ser único']);
        $this->assertEquals(1, User::count());
    }

    /** @test */
    function the_password_is_required()
    {
        $this->from('usuarios/novo')
            ->post('/usuarios/', [
                'name' => 'Duilio',
                'email' => 'duilio@styde.net',
                'password' => ''
            ])
            ->assertRedirect('usuarios/novo')
            ->assertSessionHasErrors(['password' => 'O campo senha é obrigatório']);
        $this->assertEquals(0, User::count());
    }

    /** @test */
    function the_password_must_contains_at_least_six_characters()
    {
        $this->from('usuarios/novo')
            ->post('/usuarios/', [
                'name' => 'Duilio',
                'email' => 'duilio@styde.net',
                'password' => '12'
            ])
            ->assertRedirect('usuarios/novo')
            ->assertSessionHasErrors(['password' => 'A senha deve ter no mínimo 6 caracteres']);
        $this->assertEquals(0, User::count());
    }

    /** @test */
    function it_loads_the_edit_user_page()
    {
        $this->withoutExceptionHandling();
        $user = factory(User::class)->create();
        $this->get("/usuarios/{$user->id}/editar") // usuarios/5/editar
        ->assertStatus(200)
            ->assertViewIs('users.edit')
            ->assertSee('Editar usuário')
            ->assertViewHas('user', function ($viewUser) use ($user) {
                return $viewUser->id === $user->id;
            });
    }

    /** @test */
    function it_updates_a_user()
    {
        $user = factory(User::class)->create();
        $this->withoutExceptionHandling();
        $this->put("/usuarios/{$user->id}", [
            'name' => 'Duilio',
            'email' => 'duilio@styde.net',
            'password' => '123456'
        ])->assertRedirect("/usuarios/{$user->id}");
        $this->assertCredentials([
            'name' => 'Duilio',
            'email' => 'duilio@styde.net',
            'password' => '123456',
        ]);
    }

    /** @test */
    function the_name_is_required_when_updating_the_user()
    {
        $user = factory(User::class)->create();
        $this->from("usuarios/{$user->id}/editar")
            ->put("usuarios/{$user->id}", [
                'name' => '',
                'email' => 'duilio@styde.net',
                'password' => '123456'
            ])
            ->assertRedirect("usuarios/{$user->id}/editar")
            ->assertSessionHasErrors(['name']);
        $this->assertDatabaseMissing('users', ['email' => 'duilio@styde.net']);
    }

    /** @test */
    function the_email_must_be_valid_when_updating_the_user()
    {
        $user = factory(User::class)->create();
        $this->from("usuarios/{$user->id}/editar")
            ->put("usuarios/{$user->id}", [
                'name' => 'Duilio Palacios',
                'email' => 'email não válido',
                'password' => '123456'
            ])
            ->assertRedirect("usuarios/{$user->id}/editar")
            ->assertSessionHasErrors(['email']);
        $this->assertDatabaseMissing('users', ['name' => 'Duilio Palacios']);
    }

    /** @test */
    function the_email_must_be_unique_when_updating_the_user()
    {
        //$this->withoutExceptionHandling();
        factory(User::class)->create([
            'email' => 'existing-email@example.com',
        ]);
        $user = factory(User::class)->create([
            'email' => 'duilio@styde.net'
        ]);
        $this->from("usuarios/{$user->id}/editar")
            ->put("usuarios/{$user->id}", [
                'name' => 'Duilio',
                'email' => 'existing-email@example.com',
                'password' => '123456'
            ])
            ->assertRedirect("usuarios/{$user->id}/editar")
            ->assertSessionHasErrors(['email']);
        //
    }

    /** @test */
    function the_users_email_can_stay_the_same_when_updating_the_user()
    {
        $user = factory(User::class)->create([
            'email' => 'duilio@styde.net'
        ]);
        $this->from("usuarios/{$user->id}/editar")
            ->put("usuarios/{$user->id}", [
                'name' => 'Duilio Palacios',
                'email' => 'duilio@styde.net',
                'password' => '12345678'
            ])
            ->assertRedirect("usuarios/{$user->id}"); // (users.show)
        $this->assertDatabaseHas('users', [
            'name' => 'Duilio Palacios',
            'email' => 'duilio@styde.net',
        ]);
    }

    /** @test */
    function the_password_is_optional_when_updating_the_user()
    {
        $oldPassword = 'CLAVE_ANTERIOR';
        $user = factory(User::class)->create([
            'password' => bcrypt($oldPassword)
        ]);
        $this->from("usuarios/{$user->id}/editar")
            ->put("usuarios/{$user->id}", [
                'name' => 'Duilio',
                'email' => 'duilio@styde.net',
                'password' => ''
            ])
            ->assertRedirect("usuarios/{$user->id}"); // (users.show)
        $this->assertCredentials([
            'name' => 'Duilio',
            'email' => 'duilio@styde.net',
            'password' => $oldPassword // VERY IMPORTANT!
        ]);
    }

    /** @test */
    function it_deletes_a_user()
    {
        $this->withoutExceptionHandling();
        $user = factory(User::class)->create();
        $this->delete("usuarios/{$user->id}")
            ->assertRedirect('usuarios');
        $this->assertDatabaseMissing('users', [
            'id' => $user->id
        ]);
        //$this->assertSame(0, User::count());
    }

}
