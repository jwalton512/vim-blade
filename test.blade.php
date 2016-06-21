<?php if($foo='bar' ) { $something() } ?>
Hello, {{ $name }}.

The current UNIX timestamp is {{ time() }}.

Hello, @{{ name }}.

{{ isset($name) ? $name : 'Default' }}

Hello, {!! $name !!}.

@if ($foo == 'bar') @endif

@if (count($records) === 1)
    I have one record!
@elseif (count($records) > 1)
    I have multiple records!
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

@forelse ($users as $user)
    <li>{{ $user->name }}</li>
@empty
    <p>No users</p>
@endforelse

@while (true)
    <p>I'm looping forever.</p>
@endwhile

@can('update-post', $post)
    <!-- current user can update the post -->
@else
    <!-- current user can't update the post -->
@endcan

<div>
    @include('shared.errors')
    <form>
        <!-- Form Contents -->
    </form>
</div>

@each('view.name', $jobs, 'job')

{{-- This comment will not be present in the rendered HTML --}}

{{--
    This comment spans
    multiple lines
    @yield('dont highlight')
--}}

{{-- todo fixme xxx --}}

@inject('metrics', 'App\Services\MetricsService')

@push('scripts')
    <script src="/example.js"></script>
@endpush

<head>
    <!-- Head Contents -->
    <title>
        @hasSection('title')
            Test - @yield('title')
        @else
            Test
        @endif
    </title>

    @stack('scripts')
</head>

<div>
    @section('sidebar')
        This is the master sidebar.
    @show

    @yield('content')
</div>

@section('title', 'Page Title')

@section('sidebar')
    @parent
    <p>This is appended to the master sidebar.</p>
@endsection

<input name="example" {{ old('example') ? 'checked' : '' }} />

<?php
    $collection = collect([
        'foo' => [
            'bar',
            'baz',
        ]
    ])
?>

@include('pages.home', [
    'foo' => [
        'bar',
        'baz',
    ]
])

{{
    sprintf(
        'This %s a multiline echo statement',
        $foo
    )
}}
