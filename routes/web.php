<?php

Route::get('/', function () {
    return 'Home';
});

Route::get('/usuarios', 'UserController@index')
    ->name('users.index');

Route::get('/usuarios/{user}', 'UserController@show')
    ->where('user', '[0-9]+')
    ->name('users.show');

Route::get('/usuarios/novo', 'UserController@create')->name('users.create');

Route::get('/usuarios/{user}/editar', 'UserController@edit')->name('users.edit');

Route::put('/usuarios/{user}', 'UserController@update');

Route::post('/usuarios', 'UserController@store');

Route::delete('/usuarios/{user}', 'UserController@destroy')->name('users.destroy');

Route::get('/saudar/{name}/{nickname?}', 'WelcomeUserController');