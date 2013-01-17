@extends('layouts.master')

@section('content')

<div class="row">
    <div class="eight centered columns">
        <h1>Group: {{ $group->name }}</h1>
        <h3>{{ $group->address }}@submattic.com</h1>
        <h2>Subscribers:</h2>
        <ol>
            @foreach ($subscribers as $subscriber)
            <li>{{ $subscriber->name }}: <a href="{{ $subscriber->email }}">{{ $subscriber->email }}</a></li>
            @endforeach
        </ol>

        <form action="/groups/{{ $group->id }}" method="post">
            <field type="hidden" name="_method" value="DELETE">
            <a href="/groups" class="button">Back</a>
            <input type="submit" class="button" value="Delete">
        </form>
    </div>
</div>

@stop
