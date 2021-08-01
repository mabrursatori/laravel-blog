@extends('layouts.app')

@section('content')
<<!-- CONTENT -->


        <section class="blog-post-area">
            <div class="container">
                <div class="row">
                    <div class="blog-post-area-style">
                            <div class="col-md-12">
                                <div class="single-post-big">
                                    <div class="row d-flex align-items-center">
                                    <div class="big-image align-self-center col-md-6 col-sm-12">
                                        <img src="{{Storage::url($mainBlog->image)}}" alt="">
                                    </div>
                                    <div class="big-text col-md-6 col-sm-12">
                                        <h3><a href="{{route('show', $mainBlog->slug)}}">{{ $mainBlog->title }}</a></h3>
                                        <div class="mabrur-first">
                                        <p>{!! $mainBlog->content !!}</p>
                                        </div>
                                        <h4><span class="date">{{  date("d M Y", strtotime($mainBlog->created_at)) }}</span><span class="author">Posted By: <span class="author-name">{{ $mainBlog->author }}</span></span>
                                        </h4>
                                    </div>
                                    </div>
                                </div>
                            </div>
                            @foreach ($blogs as $blog)
                                <div class="col-md-3">
                                <div class="single-post">
                                    <img style="height: 150px; object-fit: cover;" src="{{Storage::url($blog->image)}}" alt="">
                                    <div style="overflow: hidden; height: 40px;">
                                    <h4 ><a href="{{route('show', $blog->slug)}}" style="color: black;">{{ $blog->title }}</a></h4>
                                    </div>
                                    <h4><span>Posted By: <span class="author-name">{{ $blog->author }}</span></span>
                                    </h4>
                                    <div style="overflow: hidden; height: 120px;">
                                    <p>{!! $blog->content !!}</p>
                                    </div>
                                    <h4><span>{{  date("d M Y", strtotime($blog->created_at)) }}</span></h4>
                                </div>
                            </div>
                            @endforeach




                    </div>
                </div>
            </div>
            <div class="pegination">

                <!-- <ul>
                    <li><i class="fa fa-angle-left" aria-hidden="true"></i></li>
                    <li class="active">1</li>
                    <li>2</li>
                    <li>3</li>
                    <li><i class="fa fa-angle-right" aria-hidden="true"></i></li>
                </ul> -->

<div class="row text-center">
                {{ $blogs->links() }}
                </div>
            </div>
        </section>
        <!-- AKHIR CONTENT -->
@endsection
