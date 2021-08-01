@extends('layouts.admin')
@section('title')
User / Detail
@endsection
@section('content')
<div class="container-fluid">


                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">User / Detail</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-md-12">


                            <ul class="list-group list-group-flush">
                            <li class="list-group-item">{{ $user->name }}</li>
                            <li class="list-group-item">{!! $user->bio !!}</li>
                            </ul>
                        </div>

                    </div>




                </div>
@endsection
