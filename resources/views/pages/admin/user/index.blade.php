@extends('layouts.admin')
@section('title')
User
@endsection
@section('content')
<div class="container-fluid">


                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">User</h1>
                        <a href="{{ route('user.create') }}" class="btn btn-primary">Tambah Data</a>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        {{-- FILTER --}}
                        <div class="col-md-6">
                <form action="{{route('user.index')}}">
                    <div class="input-group">
                        <input name="keyword" type="text" value="{{Request::get('keyword')}}" class="form-control" placeholder="Filter by name">
                        <div class="input-group-append">
                            <input type="submit" value="Cari" class="btn btn-primary">
                        </div>
                    </div>
                </form>
            </div>
                        <div class="col-md-12">
                            @if(session('status'))
                            <div class="alert alert-success">
                                 {{session('status')}}
                            </div>
                            @endif
                            <table class="table">
  <thead>
    <tr>
      <th scope="col">No</th>
      <th scope="col">Nama</th>
      <th scope="col">Email</th>
      <th scope="col">Username</th>
      <th scope="col">Image</th>
      <th scope="col">Role</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
      @php
    $i = 1;
  @endphp
      @forelse ($users as $user)


      <th scope="row">{{ $i++ }}</th>
      <td>{{$user->name}}</td>
      <td>{{$user->email}}</td>
      <td>{{$user->username}}</td>
      <td>
          <img src="{{Storage::url($user->image)}}" width="100px" height="100px" class="rounded mx-auto d-block" alt="...">
      </td>
      <td>{{$user->roles}}</td>
      <td>
          <a href="{{route('user.edit', $user->id)}}" class="btn btn-warning btn-sm">Edit</a>
          <a href="{{route('user.show', $user->id)}}" class="btn btn-primary btn-sm">Detail</a>
          <form class="d-inline" method="POST" onsubmit="return confirm('Apa kamu yakin?')" action="{{route('user.destroy', [$user->id])}}">
              @csrf
          <input type="hidden" value="DELETE" name="_method">
          <button type="submit" class="btn btn-danger btn-sm">Delete</button>
          </form>
      </td>
    </tr>
    @empty
    <td colspan="7" class="text-center">
            Data Kosong
        </td>
    @endforelse
    <tr>
  </tbody>
   {{ $users->links() }}
</table>
                        </div>

                    </div>




                </div>
@endsection

