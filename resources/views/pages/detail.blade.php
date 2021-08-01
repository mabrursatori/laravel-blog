@extends('layouts.app')

@section('content')
<!-- KONTEN -->
        <section class="single-blog-area">
            <div class="container mt-4">
                <div class="row mt-4">
                   <div class="col-md-12">
                    <div class="border-top">
                        <div class="col-md-8">
                        <div class="blog-area">
                            <div class="blog-area-part">
                                <h2>{{ $blog->title }}</h2>
                                <div>
                                    <img src="{{Storage::url($blog->image)}}" alt="">
                                </div>
                                <div class="for-style">
                                <p>{!! $blog->content !!}</p>
                                </div>
                            </div>
                            <div class="ads-area">
                                <img src="{{ asset('frontend/img/ads.jpg') }}" alt="">
                                <p>Your Ad Banner Goes Here</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mt-1">

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
