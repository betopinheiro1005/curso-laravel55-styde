@extends('layout')

@section('title', "Usuário {$user->id}")

@section('content')
    <h1>Usuário #{{ $user->id }}</h1>

    <p>Nome do usuário: {{ $user->name }}</p>
    <p>Email: {{ $user->email }}</p>

    <p>
        <a href="{{ route('users.index') }}">Voltar a lista de usuários</a>
    </p>
@endsection