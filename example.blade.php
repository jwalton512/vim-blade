<html>
    <body>
        @section('sidebar')
            This is the master sidebar.
        @stop

        <div class="container">
            @yield('content')
        </div>
    </body>
</html>

@extends('layouts.master')

@section('sidebar')
    @parent

    <p>This is appended to the master sidebar.</p>
@stop

@section('content')
    <p>This is my body content.</p>
@stop

Hello, {{ $name }}.

The current UNIX timestamp is {{ time() }}.

@if (count($records) > 0)
    I have records!
@else
    I don't have any records!
@endif

@unless (Auth::check())
    You are not signed in.
@endunless

@for ($i = 0; $i < 10; $i++)
    The current value is {{ $i }}
@endfor

@foreach ($users as $user)
    <p>This is user {{ $user->id }}</p>
@endforeach

@while (true)
    <p>I'm looping forever.</p>
@endwhile

@include('view.name')

{{-- This comment will not be in the rendered HTML --}}
