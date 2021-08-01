@extends('layouts.admin')
@section('title')
User / Create
@endsection
@section('content')
 <div class="container-fluid">


                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">User / Create</h1>
                    </div>

                    <!-- Content Row -->
                    <form action="{{route('user.store')}}" method="post" enctype="multipart/form-data">
                        @csrf
                        @if ($errors->any())
           <div class="alert alert-danger">
               <ul>
                   @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                   @endforeach
               </ul>
           </div>
       @endif
                    <div class="row">
                        <div class="col-md-12">
                        </div>
                        <div class="col-md-12 text-center">
                            <img src="{{ asset('backend/img/user.png') }}" id="output" width="100px" height="100px" style="object-fit: cover; border-radius: 50%;" alt="...">
                        </div>
                        <div class="col-md-12 text-center">
                            <img src="{{ asset('backend/img/tambah.jpg') }}" width="30px" alt="">
                        </div>
                        <div class="col-md-12 text-center" style="margin-top: -30px; opacity: 0;">
                            {{-- GAMBAR --}}
                            <input name="image" type="file" accept="image/*" onchange="loadFile(event)" id="customFile"
                            class="btn btn-primary {{$errors->first('image') ? "is-invalid": ""}}" width="5px">
                            <div class="invalid-feedback">
                                {{$errors->first('image')}}
                                </div>
                        </div>
                        <div class="col-md-6 col-sm-12">

                                <!-- NAMA -->
                                <div class="form-group">
                                <label for="name">Nama</label>
                                <input value="{{old('name')}}" name="name" type="text"
                                class="form-control {{$errors->first('name') ? "is-invalid": ""}}"
                                 name="name" id="name">
                                 <div class="invalid-feedback">
                                {{$errors->first('name')}}
                                </div>
                                </div>
                                {{-- USERNAME --}}
                                 <div class="form-group">
                                <label for="name">Username</label>
                                <input value="{{old('username')}}" name="username" type="text"
                                class="form-control {{$errors->first('username') ? "is-invalid": ""}}"
                                 name="username" id="username">
                                 <div class="invalid-feedback">
                                {{$errors->first('username')}}
                                </div>
                                </div>
                                {{-- ROLE --}}
                                 <div class="form-group">
                                <label for="roles">Role</label>
                                    <select class="form-control {{$errors->first('roles') ? "is-invalid": ""}}" name="roles" id="roles">
                                        <option>Pilih Status</option>
                                        <option value="ADMIN" {{old('roles') == "ADMIN" ? "selected" : ""}}>ADMIN</option>
                                        <option value="PENULIS" {{old('roles') == "PENULIS" ? "selected" : ""}}>PENULIS</option>
                                    </select>
                                    <div class="invalid-feedback">
                                {{$errors->first('roles')}}
                                </div>
                                </div>

                        </div>
                        <div class="col-md-6 col-sm-12" >
                                <!-- EMAIL -->
                                <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" value="{{old('email')}}"  name="email"
                                class="form-control {{$errors->first('email') ? "is-invalid": ""}}" id="email">
                                <div class="invalid-feedback">
                                {{$errors->first('email')}}
                                </div>
                                </div>
                                <!-- PASSWORD -->
                                <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password"
                                class="form-control {{$errors->first('password') ? "is-invalid": ""}}" id="password">
                                <div class="invalid-feedback">
                                {{$errors->first('password')}}
                                </div>
                                </div>
                                <!-- CONFIRMATION PASSWORD -->
                                <div class="form-group">
                                <label for="confirmation_password"> Confirmation Password</label>
                                <input type="password" name="confirmation_password"
                                class="form-control {{$errors->first('confirmation_password') ? "is-invalid": ""}}" id="confirmation_password">
                                <div class="invalid-feedback">
                                {{$errors->first('confirmation_password')}}
                                </div>
                                </div>

                        </div>
                        <div class="col-md-12">
                            {{-- BIO --}}
                            <div class="form-group">
                            <label for="bio">Biografi</label>

                            <textarea name="bio" class="ckeditor" id="bio" rows="3">{{old('bio')}}</textarea>

                                @if ($errors->first('bio'))
                                <style>
                                    #cke_bio{
                                        border: 1px solid red;
                                    }
                                </style>
                                @endif
                                <small class="form-text is-invalid" style="color: red;">
                                    {{$errors->first('bio')}}
                                </small>
                            </div>
                            <button type="submit" class="btn btn-primary first">Tambah User</button>
                        </div>
                    </div>
                    </form>



                </div>
@endsection
@push('top-ckeditor')
<!-- Javascript -->
	<script type="text/javascript">
	var loadFile = function(event) {
	var output = document.getElementById('output');
	output.src = URL.createObjectURL(event.target.files[0]);
	};
	</script>
@endpush
@push('bottom-ckeditor')
<script type="text/javascript" src="{{ asset('backend/ckeditor/ckeditor.js') }}"></script>
@endpush
