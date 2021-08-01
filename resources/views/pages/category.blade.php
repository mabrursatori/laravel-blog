@extends('layouts.app')

@section('content')
<!-- KONTEN -->
        <section class="single-blog-area">
            <div class="container">
                <div class="row">
                   <div class="col-md-12">
                    <div class="border-top">
                        <div class="col-md-8">
                        <div class="blog-area">
                            <div class="blog-area-part">
                                @foreach ($blogs as $blog)
                                <div class="row" style="margin-top: 40px;">
                                   <div class="col-md-6 col-sm-12">
                                       <img src="{{Storage::url($blog->image)}}" alt="">
                                   </div>
                                   <div class="col-md-6 col-sm-12">
                                       <h4><a href="{{route('show', $blog->slug)}}" class="title">{{ $blog->title }}</a></h4>
                                       <div class="content-category" style="padding-top: -30px;">
                                       {!! $blog->content !!}
                                       </div>
                                   </div>
                               </div>
                                @endforeach

                               @if(count($blogs) == 0)
                               <h3>Belum ada artikel</h3>
                               @endif
                            </div>
                            <div class="ads-area">
                                <img src="{{ asset('frontend/img/ads.jpg') }}" alt="">
                                <p>Your Ad Banner Goes Here</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">

                        <div class="sidebar-ads">
                            <img src="{{ asset('frontend/img/sidebar-ads.jpg') }}" alt="">
                            <p>Place For Your <br> Ad Banner</p>
                        </div>
                        <div class="tags">
                            <h2 class="sidebar-title">Tags</h2>
                            <!-- KATEGORI -->
                            @foreach ($allCategories as $category)
                            <p><a href="{{route('category', $category->name)}}">{{ $category->name }}</a></p>
                            @endforeach

                        </div>
                    </div>
                    </div>
                    </div>
                </div>
            </div>
        </section>
<!-- KONTEN -->
@endsection
