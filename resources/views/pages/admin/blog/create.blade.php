@extends('layouts.admin')
@section('title')
Blog / Create
@endsection
@section('content')
  <div class="container-fluid">


                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Blog / Create</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-md-12">
                        <form action="{{route('blog.store')}}" method="post" enctype="multipart/form-data">
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
                        {{-- TITLE --}}
                        <div class="form-group">
                        <label for="title">Judul</label>
                        <input type="text" value="{{old('title')}}" name="title"
                        class="form-control {{$errors->first('title') ? "is-invalid": ""}}" id="title">
                        <div class="invalid-feedback">
                            {{$errors->first('title')}}
                        </div>
                        </div>
                        {{-- KATEGORI --}}
                        <div class="form-group">
                        <label for="categories">Kategori</label><br>
                        <select name="categories[]" multiple id="categories" class="form-control"></select>
                        @if ($errors->first('categories'))
                                <small class="form-text is-invalid" style="color: red;">
                                    {{$errors->first('categories')}}
                                </small>
                                @endif
                        </div>
                        {{-- GAMBAR --}}
                        <div class="form-group">
                        <label for="title">Gambar</label>
                        <div class="custom-file">
                        <input type="file"  name="image"  class="custom-file-input {{$errors->first('image') ? "is-invalid": ""}}"
                        accept="image/*" onchange="loadFile(event)">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                        <div class="invalid-feedback">
                            {{$errors->first('image')}}
                        </div>
                        </div>
                        </div>
                        <img src="{{ asset('backend/img/default-image.jpg') }}" id="output" style="object-fit: cover; height: 500px;" width="800px" class="img-fluid" alt="Responsive image">
                        {{-- KONTEN --}}
                         <div class="form-group mt-4">
                         <label for="content">Konten</label>
                         <textarea name="content" class="form-control ckeditor" id="content" rows="3" style="width: 500;">
                            {{old('content')}}
                        </textarea>
                         @if ($errors->first('content'))
                                <style>
                                    #cke_content{
                                        border: 1px solid red;
                                    }
                                </style>
                                <small class="form-text is-invalid" style="color: red;">
                                    {{$errors->first('content')}}
                                </small>
                                @endif
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
