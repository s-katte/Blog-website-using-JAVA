<%-- 
    Document   : blog
    Created on : 27 Oct, 2020, 9:25:36 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog|JSP</title>
<!-- BootStrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css" integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js" integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD" crossorigin="anonymous"></script>

    <!-- Custom CSS -->
    <link rel="stylesheet" href="./css/main.css">

</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-custom-gradient shadow-sm">
        <div class="container container-fluid">
            <a class="navbar-brand img-container logo py-0" href="#">
                <img src="./assets/logo.png" alt="" style="width: 4rem;">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
                    <li class="nav-item font-weight-bold">
                        <a class="nav-link" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item font-weight-bold ml-lg-4">
                        <a class="nav-link" aria-current="page" href="#">Manage</a>
                    </li>
                    <li class="nav-item font-weight-bold ml-lg-4">
                        <div class="btn btn-primary px-0 px-lg-2">
                            Logout
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="img-container text-center">
            <img src="./assets/card-img-placeholder-top.svg" alt="" style="width: 40rem">
        </div>
        <h1 class="font-weight-bold my-5 text-center">
            Blog Title
        </h1>
        <div class="d-flex justify-content-between">
            <h5 class="text-muted font-weight-bold">
                24th Oct, 2020
            </h5>
            <h5 class="text-muted font-weight-bold">
                - John Doe
            </h5>
        </div>
        <div class="text-justify">
            &emsp;&emsp;&emsp;
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum dicta delectus sint quae omnis, sed maxime. In, perferendis! Perferendis perspiciatis mollitia, dicta odit qui odio delectus alias? Ea reprehenderit necessitatibus, ab reiciendis voluptates iure delectus sapiente ullam pariatur explicabo dolorem cupiditate assumenda repellat officia laborum incidunt soluta, est veritatis debitis eum, quam consequuntur iste quidem totam? Modi repellendus, consequuntur debitis reiciendis quasi possimus? Maiores, doloremque sequi dolor magni vero, odit dolore fugit tenetur sint et quod distinctio quos? Aperiam ut, distinctio eum porro optio quod voluptate, fugiat sit nemo quis soluta fuga laborum reprehenderit molestias quam, asperiores debitis provident doloremque quia! Odio culpa saepe officia illo molestias ad blanditiis repellendus magni incidunt asperiores. Omnis, debitis autem ipsa sed et exercitationem, nostrum nobis doloribus impedit blanditiis nihil vitae? Unde excepturi quos delectus quas ipsam quam obcaecati itaque maxime corporis? Nesciunt, deleniti maxime! Suscipit provident non rem officia nobis tenetur accusantium excepturi illum possimus cumque nam culpa illo et atque cupiditate labore perferendis veniam expedita sint itaque quis assumenda, distinctio recusandae! Cumque qui quisquam dolore dicta quod autem nihil excepturi harum, odio voluptatibus unde ducimus officiis. Perspiciatis architecto eos esse amet soluta fugit nobis ex. Ducimus nulla odio aperiam praesentium, eum necessitatibus.
            <br><br>
            &emsp;&emsp;&emsp;
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum dicta delectus sint quae omnis, sed maxime. In, perferendis! Perferendis perspiciatis mollitia, dicta odit qui odio delectus alias? Ea reprehenderit necessitatibus, ab reiciendis voluptates iure delectus sapiente ullam pariatur explicabo dolorem cupiditate assumenda repellat officia laborum incidunt soluta, est veritatis debitis eum, quam consequuntur iste quidem totam? Modi repellendus, consequuntur debitis reiciendis quasi possimus? Maiores, doloremque sequi dolor magni vero, odit dolore fugit tenetur sint et quod distinctio quos? Aperiam ut, distinctio eum porro optio quod voluptate, fugiat sit nemo quis soluta fuga laborum reprehenderit molestias quam, asperiores debitis provident doloremque quia! Odio culpa saepe officia illo molestias ad blanditiis repellendus magni incidunt asperiores. Omnis, debitis autem ipsa sed et exercitationem, nostrum nobis doloribus impedit blanditiis nihil vitae? Unde excepturi quos delectus quas ipsam quam obcaecati itaque maxime corporis? Nesciunt, deleniti maxime! Suscipit provident non rem officia nobis tenetur accusantium excepturi illum possimus cumque nam culpa illo et atque cupiditate labore perferendis veniam expedita sint itaque quis assumenda, distinctio recusandae! Cumque qui quisquam dolore dicta quod autem nihil excepturi harum, odio voluptatibus unde ducimus officiis. Perspiciatis architecto eos esse amet soluta fugit nobis ex. Ducimus nulla odio aperiam praesentium, eum necessitatibus.
            <br><br>
            &emsp;&emsp;&emsp;
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Earum dicta delectus sint quae omnis, sed maxime. In, perferendis! Perferendis perspiciatis mollitia, dicta odit qui odio delectus alias? Ea reprehenderit necessitatibus, ab reiciendis voluptates iure delectus sapiente ullam pariatur explicabo dolorem cupiditate assumenda repellat officia laborum incidunt soluta, est veritatis debitis eum, quam consequuntur iste quidem totam? Modi repellendus, consequuntur debitis reiciendis quasi possimus? Maiores, doloremque sequi dolor magni vero, odit dolore fugit tenetur sint et quod distinctio quos? Aperiam ut, distinctio eum porro optio quod voluptate, fugiat sit nemo quis soluta fuga laborum reprehenderit molestias quam, asperiores debitis provident doloremque quia! Odio culpa saepe officia illo molestias ad blanditiis repellendus magni incidunt asperiores. Omnis, debitis autem ipsa sed et exercitationem, nostrum nobis doloribus impedit blanditiis nihil vitae? Unde excepturi quos delectus quas ipsam quam obcaecati itaque maxime corporis? Nesciunt, deleniti maxime! Suscipit provident non rem officia nobis tenetur accusantium excepturi illum possimus cumque nam culpa illo et atque cupiditate labore perferendis veniam expedita sint itaque quis assumenda, distinctio recusandae! Cumque qui quisquam dolore dicta quod autem nihil excepturi harum, odio voluptatibus unde ducimus officiis. Perspiciatis architecto eos esse amet soluta fugit nobis ex. Ducimus nulla odio aperiam praesentium, eum necessitatibus.
        </div>
        <h2 class="font-weight-bold text-left my-5">
            Comments
        </h2>
        <div class="card shadow-custom-lg mb-3">
            <div class="card-body">
                <form id="commentForm" action="" class="text-left bg-light p-3 rounded">
                    <div class="input-group">
                        <textarea type="text" class="form-control" placeholder="Add your comments"></textarea>
                    </div>
                    <div class="text-right mt-3">
                        <div class="btn bg-custom-gradient">Add comment</div>
                    </div>
                </form>
            </div>
        </div>
        <div class="card shadow-custom-lg mb-3">
            <div class="card-body p-4">
                <div class="d-flex justify-content-between">
                    <h4 class="font-weight-bold">John Doe</h4>
                    <div class="text-muted">22nd Oct, 2020</div>
                </div>
                <div class="text-justify">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam iste excepturi quisquam quo autem quis, iure perferendis tenetur ut voluptatem tempore non laudantium hic aliquid obcaecati consectetur sequi. Dolorem corporis, ducimus odit non perspiciatis ipsa molestiae delectus assumenda nihil nisi excepturi repellat, deserunt ut fuga voluptatibus. Illum facilis cum saepe, iusto voluptatem ducimus, quaerat pariatur non, suscipit quas vero libero voluptas consectetur nihil hic magni eos tempore vel impedit eveniet ad deleniti. Et repellat excepturi vel harum, nostrum placeat hic mollitia praesentium laudantium nemo nobis quisquam sapiente obcaecati, repudiandae, ipsam ullam! Quae cum pariatur assumenda soluta tempore reiciendis sapiente quia.
                </div>
                <div class="reply">
                    <div class="d-flex justify-content-between">
                        <h4 class="font-weight-bold">John Doe</h4>
                        <div class="text-muted">22nd Oct, 2020</div>
                    </div>
                    <div class="text-justify">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam iste excepturi quisquam quo autem quis, iure perferendis tenetur ut voluptatem tempore non laudantium hic aliquid obcaecati consectetur sequi. Dolorem corporis, ducimus odit non perspiciatis ipsa molestiae delectus assumenda nihil nisi excepturi repellat, deserunt ut fuga voluptatibus. Illum facilis cum saepe, iusto voluptatem ducimus, quaerat pariatur non, suscipit quas vero libero voluptas consectetur nihil hic magni eos tempore vel impedit eveniet ad deleniti. Et repellat excepturi vel harum, nostrum placeat hic mollitia praesentium laudantium nemo nobis quisquam sapiente obcaecati, repudiandae, ipsam ullam! Quae cum pariatur assumenda soluta tempore reiciendis sapiente quia.
                    </div>
                    <div class="reply">
                        <div class="d-flex justify-content-between">
                            <h4 class="font-weight-bold">John Doe</h4>
                            <div class="text-muted">22nd Oct, 2020</div>
                        </div>
                        <div class="text-justify">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam iste excepturi quisquam quo autem quis, iure perferendis tenetur ut voluptatem tempore non laudantium hic aliquid obcaecati consectetur sequi. Dolorem corporis, ducimus odit non perspiciatis ipsa molestiae delectus assumenda nihil nisi excepturi repellat, deserunt ut fuga voluptatibus. Illum facilis cum saepe, iusto voluptatem ducimus, quaerat pariatur non, suscipit quas vero libero voluptas consectetur nihil hic magni eos tempore vel impedit eveniet ad deleniti. Et repellat excepturi vel harum, nostrum placeat hic mollitia praesentium laudantium nemo nobis quisquam sapiente obcaecati, repudiandae, ipsam ullam! Quae cum pariatur assumenda soluta tempore reiciendis sapiente quia.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card shadow-custom-lg mb-3">
            <div class="card-body p-4">
                <div class="d-flex justify-content-between">
                    <h4 class="font-weight-bold">John Doe</h4>
                    <div class="text-muted">22nd Oct, 2020</div>
                </div>
                <div class="text-justify">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam iste excepturi quisquam quo autem quis, iure perferendis tenetur ut voluptatem tempore non laudantium hic aliquid obcaecati consectetur sequi. Dolorem corporis, ducimus odit non perspiciatis ipsa molestiae delectus assumenda nihil nisi excepturi repellat, deserunt ut fuga voluptatibus. Illum facilis cum saepe, iusto voluptatem ducimus, quaerat pariatur non, suscipit quas vero libero voluptas consectetur nihil hic magni eos tempore vel impedit eveniet ad deleniti. Et repellat excepturi vel harum, nostrum placeat hic mollitia praesentium laudantium nemo nobis quisquam sapiente obcaecati, repudiandae, ipsam ullam! Quae cum pariatur assumenda soluta tempore reiciendis sapiente quia.
                </div>
            </div>
        </div>
        <div class="card shadow-custom-lg mb-3">
            <div class="card-body p-4">
                <div class="d-flex justify-content-between">
                    <h4 class="font-weight-bold">John Doe</h4>
                    <div class="text-muted">22nd Oct, 2020</div>
                </div>
                <div class="text-justify">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam iste excepturi quisquam quo autem quis, iure perferendis tenetur ut voluptatem tempore non laudantium hic aliquid obcaecati consectetur sequi. Dolorem corporis, ducimus odit non perspiciatis ipsa molestiae delectus assumenda nihil nisi excepturi repellat, deserunt ut fuga voluptatibus. Illum facilis cum saepe, iusto voluptatem ducimus, quaerat pariatur non, suscipit quas vero libero voluptas consectetur nihil hic magni eos tempore vel impedit eveniet ad deleniti. Et repellat excepturi vel harum, nostrum placeat hic mollitia praesentium laudantium nemo nobis quisquam sapiente obcaecati, repudiandae, ipsam ullam! Quae cum pariatur assumenda soluta tempore reiciendis sapiente quia.
                </div>
            </div>
        </div>
    </div>
    <footer class="bg-custom-gradient">
        <div class="container py-3">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3">
                <div class="col">
                    <div class="img-container">
                        <img src="./assets/logo.png" alt="" class="logo" style="width: 8rem;">
                    </div>
                    <h2 class="font-weight-bold my-3">
                        Write what you love
                    </h2>
                    <h2 class="font-weight-bold my-3">
                        . . . .
                    </h2>
                </div>
                <div class="col">
                    <h2 class="font-weight-bold">
                        Quick links
                    </h2>
                    <ul>
                        <li>Home</li>
                        <li>About</li>
                        <li>Create</li>
                        <li>Contact</li>
                    </ul>
                </div>
                <div class="col">
                    <h2 class="font-weight-bold">
                        Developed by
                    </h2>
                    <ul>
                        <li>Vaibhav Saini</li>
                        <li>Anushka Gulave</li>
                        <li>Shubham Katte</li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
