@extends('layout')

@section('title', "Atualizar usuário")

@section('content')
    <div class="card">
        <h4 class="card-header">Editar usuário</h4>
        <div class="card-body">

            @if ($errors->any())
                <div class="alert alert-danger">
                    <h6>Por favor corrija os erros abaixo:</h6>
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <form method="POST" action="{{ url("usuarios/{$user->id}") }}">
                {{ method_field('PUT') }}
                {{ csrf_field() }}

                <div class="form-group">
                    <label for="name">Nome:</label>
                    <input type="text" class="form-control" name="name" id="name" placeholder="Pedro Perez" value="{{ old('name', $user->name) }}">
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" name="email" id="email" placeholder="pedro@example.com" value="{{ old('email', $user->email) }}">
                </div>

                <div class="form-group">
                    <label for="password">Senha:</label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Maior que 6 caracteres">
                </div>

                <button type="submit">Atualizar usuário</button>

                <a href="{{ route('users.index') }}" class="btn btn-link">Voltar a lista de usuários</a>

            </form>

        </div>
    </div>
@endsection
