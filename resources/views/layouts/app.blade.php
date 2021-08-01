<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Front page</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,900" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('frontend/css/bootstrap.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/font-awesome.min.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/owl.carousel.min.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/owl.theme.default.min.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/responsive.css') }}">
</head>

<body>
    <div class="wrapper">
        <header class="header">
            <div class="container">
                <div class="row">
                    <div class="col-md-2">
                        <div class="logo">
                            <h2><a href="{{ route('home') }}">EGRASS.CO.ID</a></h2>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="menu">
                            <ul>
                                @foreach ($categories as $category)
                                    <li><a href="{{route('category', $category->name)}}">{{ $category->name }}</a></li>
                                @endforeach
                                @guest
                                <li class="auth"><a href="{{ route('register') }}">Daftar</a></li>
                                <li class="auth"><a href="{{ route('login') }}">Masuk</a></li>
                                 @else
                                 <li class="auth"><a href="{{ route('dashboard') }}">Buat Artikel</a></li>
                                <li class="auth" style="margin-right: -80px;"><a href="#">Logout</a></li>
                                 <li class="auth" style="opacity: 0;">
                                    <form action="{{ url('logout')}}" method="POST">
                                    @csrf
                                    <button type="submit" href="#">Logout</button>
                                    </form>
                                </li>
                                @endguest
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </header>


        @yield('content')

        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="footer-bg">
                            <div class="row">
                                <div class="col-md-12">
                                <p class="text-center text-white">Copyright©2020-All Rights Reserved By <a href="http://www.mabrur.epizy.com" target="_blank">Mabrur</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <script src="{{ asset('frontend/js/jquery-3.1.1.min.js') }}"></script>
    <script src="{{ asset('frontend/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('frontend/js/owl.carousel.min.js') }}"></script>
    <script src="{{ asset('frontend/js/active.js') }}"></script>
</body>

</html>

