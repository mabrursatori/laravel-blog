@extends('layouts.admin')
@section('title')
History
@endsection
@section('content')
<div class="container-fluid">


                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">History</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
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
      <th scope="col">Pembaca</th>
       <th scope="col">Judul Artikel</th>
       <th scope="col">Waktu</th>
       @if(Auth::user()->roles == "ADMIN")
      <th scope="col">Action</th>
      @endif
    </tr>
  </thead>
  <tbody>
      @php
    $i = 1;
  @endphp
      @foreach ($data as $item)


    <tr>
      <th scope="row">{{ $i++ }}</th>
      <td>{{ $item->name }}</td>
      <td>{{ $item->titleblog}}</td>
      <td>
          @if($item->created_at)
          {{  date("d M Y", strtotime($item->created_at)) }}
          @endif
        </td>

          @if(Auth::user()->roles == "ADMIN")
          <td>
          <form class="d-inline" method="POST" onsubmit="return confirm('Apa kamu yakin?')"
          action="{{route('transaction.destroy', [$item->id])}}">
              @csrf
          <input type="hidden" value="DELETE" name="_method">
          <button type="submit" class="btn btn-danger btn-sm">Delete</button>
          </form>
          </td>
          @endif

    </tr>
    @endforeach
    @if(count($data) == 0)
    <td colspan="5" class="text-center">
            Data Kosong
        </td>
    @endif
  </tbody>
  {{ $data->links() }}
</table>
                        </div>

                    </div>




                </div>
@endsection

