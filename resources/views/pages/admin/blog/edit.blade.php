@extends('layouts.admin')
@section('title')
Blog / Edit
@endsection
@section('content')
  <div class="container-fluid">


                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Blog / Edit</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-md-12">
                        <form action="{{route('blog.update', $blog->id)}}" method="post" enctype="multipart/form-data">
                            @csrf
                            <input type="hidden" value="PUT" name="_method">
                            @if ($errors->any())
           <div class="alert alert-danger">
               <ul>
                   @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                   @endforeach
               </ul>
           </div>
       @endif
                        <div class="form-group">
                        <label for="title">Judul</label>
                        <input type="text" value="{{old('title') ? old('title') : $blog->title}}"
                        name="title" class="form-control" id="title">
                        </div>

                        <div class="form-group">
                        <label for="categories">Kategori</label><br>
                        <select name="categories[]" multiple id="categories" class="form-control"></select>
                        </div>
                        @if(Auth::user()->roles == 'ADMIN')
                        <div class="form-group">
                                <label for="roles">status</label>
                                    <select class="form-control {{$errors->first('status') ? "is-invalid": ""}}" name="status" id="status">
                                        <option>Pilih Status</option>
                                        <option value="PENDING" {{old('status') == "ADMIN"  ? "selected" : ($blog->status == "PENDING" ? "selected" : "")}}>
                                            PENDING</option>
                                        <option value="ACCEPTED" {{old('status') == "PENULIS" ? "selected" : ($blog->status == "ACCEPTED" ? "selected" : "")}}>
                                            ACCEPTED</option>
                                    </select>
                                    <div class="invalid-feedback">
                                {{$errors->first('roles')}}
                            </div>
                            </div>
                            @endif

                        <div class="form-group">
                        <label for="title">Gambar</label>
                        <div class="custom-file">
                        <input type="file" name="image" value="{{old('image') ? old('image') : null}}"
                        class="custom-file-input" accept="image/*" onchange="loadFile(event)">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                        </div>
                        </div>
                        <img src="{{Storage::url($blog->image)}}" id="output" style="object-fit: cover; height: 500px;" width="800px" class="img-fluid" alt="Responsive image">

                         <div class="form-group mt-4">
                         <label for="content">Konten</label>
                         <textarea name="content" class="form-control ckeditor" id="content" rows="3" style="width: 500;">
                            {{old('content') ? old('content') : $blog->content}}
                        </textarea>
                         </div>
                         <button type="submit" class="btn btn-primary first">Tambah</button>
                        </form>
                        </div>
                    </div>



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

@push('ajax')
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script>
    $('#categories').select2({
        ajax: {
            url: 'http://127.0.0.1:8000/admin/ajax/categories/search',
            processResults: function(data) {
                return {
                    results: data.map(function(item) {
                        return {
                            id: item.id,
                            text: item.name
                        }
                    })
                }
            }
        }
    });
</script>
@endpush
