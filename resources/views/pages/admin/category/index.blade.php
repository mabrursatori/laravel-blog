@extends('layouts.admin')
@section('title')
Category
@endsection
@section('content')
<div class="container-fluid">


                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Category</h1>
                        <a href="{{ route('category.create') }}" class="btn btn-primary">Tambah Data</a>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                         <div class="col-md-6">
                <form action="{{route('category.index')}}">
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
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>

    @php
    $i = 1;
  @endphp
      @forelse ($data as $item)
    <tr>
      <th scope="row">{{ $i++ }}</th>
      <td>{{$item->name}}</td>
      <td>
          <a href="{{route('category.edit', $item->id)}}" class="btn btn-warning btn-sm">Edit</a>
            <form onsubmit="return confirm('Apa kamu yakin?')" action="{{route('category.destroy', $item->id)}}" method="post" class="d-inline">
                @csrf
                @method('delete')
                <button class="btn btn-danger btn-sm">
                    Delete
                </button>
            </form>
      </td>
    </tr>
    @empty
    <tr>
        <td colspan="3" class="text-center">
            Data Kosong
        </td>
    </tr>
    @endforelse
  </tbody>
   {{ $data->links() }}
</table>
                        </div>

                    </div>




                </div>
@endsection

