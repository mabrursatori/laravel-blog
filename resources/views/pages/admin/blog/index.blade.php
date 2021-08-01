@extends('layouts.admin')
@section('title')
Blog
@endsection
@section('content')
<div class="container-fluid">


                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Blog</h1>
                        <a href="{{ route('blog.create') }}" class="btn btn-primary">Tambah Data</a>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <div class="col-md-6">
                <form action="{{route('blog.index')}}">
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
      <th scope="col">Judul</th>
      <th scope="col">Gambar</th>
      <th scope="col">Penulis</th>
      <th scope="col">Kategori</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
      @php
         $i =1;
      @endphp
      @forelse ($blogs as $blog)
    <tr>
      <th scope="row">{{ $i++ }}</th>
      <td style="width: 200px;">{{$blog->title}}</td>
      <td><img src="{{Storage::url($blog->image)}}" width="100px" height="100px" class="rounded mx-auto d-block" alt="..."></td>
      <td>{{$blog->user->name}}</td>
      <td>
         @foreach ($blog->categories as $category)
            <li>
                {{ $category->name }}
            </li>
         @endforeach
      </td>
      <td>
          {{$blog->status}}
      </td>
      <td>

        <a href="{{route('blog.edit', $blog->id)}}" class="btn btn-warning btn-sm">Edit</a>
          <a href="{{route('blog.show', $blog->id)}}" class="btn btn-primary btn-sm">Detail</a>
          <form class="d-inline" method="POST" onsubmit="return confirm('Apa kamu yakin?')"
           action="{{route('blog.destroy', [$blog->id])}}">
              @csrf
          <input type="hidden" value="DELETE" name="_method">
          <button type="submit" class="btn btn-danger btn-sm">Delete</button>
          </form>
      </td>
    </tr>
     @empty
    <td colspan="6" class="text-center">
            Data Kosong
        </td>
    @endforelse
  </tbody>
   {{ $blogs->links() }}
</table>
                        </div>

                    </div>




                </div>
@endsection

