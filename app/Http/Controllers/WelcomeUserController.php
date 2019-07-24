<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class WelcomeUserController extends Controller
{
    public function __invoke($name, $nickname = null)
    {
        $name = ucfirst($name);
        $nickname = ucfirst($nickname);

        if ($nickname) {
            return "Bem-vindo {$name}, teu apelido é {$nickname}";
        } else {
            return "Bem-vindo {$name}";
        }
    }
}
