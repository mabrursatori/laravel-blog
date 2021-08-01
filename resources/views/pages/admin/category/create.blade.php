@extends('layouts.admin')
@section('title')
Category / Create
@endsection
@section('content')
 <div class="container-fluid">


                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Category / Create</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-md-6 col-sm-12">

                    <form action="{{route('category.store')}}" method="post">
                        @csrf

                                <!-- NAMA -->
                                <div class="form-group">
                                <label for="name">Nama</label>
                                <input value="{{old('name')}}" type="text"
                                class="form-control {{$errors->first('name') ? "is-invalid": ""}}" name="name" id="name">
                                <div class="invalid-feedback">
                                {{$errors->first('name')}}
                                </div>
                                </div>
                                <button type="submit" class="btn btn-primary first">Tambah</button>

                    </form>
                    </div>
                    </div>


                </div>
@endsection

