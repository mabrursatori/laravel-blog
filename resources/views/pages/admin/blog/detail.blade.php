@extends('layouts.admin')
@section('title')
Blog / Detail
@endsection
@section('content')
<div class="container-fluid">


                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Blog / Detail</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-md-12">


                            <ul class="list-group list-group-flush">
                            <li class="list-group-item">{{ $blog->title }}</li>
                            <li class="list-group-item">{!! $blog->content !!}</li>
                            </ul>
                        </div>

                    </div>




                </div>
@endsection
