<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<style type="text/css">
@media (max-width: 767px) {
		.carousel-inner .carousel-item > div {
			display: none;
		}
		.carousel-inner .carousel-item > div:first-child {
			display: block;
		}
	}

	.carousel-inner .carousel-item.active,
	.carousel-inner .carousel-item-next,
	.carousel-inner .carousel-item-prev {
		display: flex;
	}

	/* medium and up screens */
	@media (min-width: 768px) {

		.carousel-inner .carousel-item-end.active,
		.carousel-inner .carousel-item-next {
			transform: translateX(25%);
		}

		.carousel-inner .carousel-item-start.active, 
		.carousel-inner .carousel-item-prev {
			transform: translateX(-25%);
		}
	}

	.carousel-inner .carousel-item-end,
	.carousel-inner .carousel-item-start { 
		transform: translateX(0);
	}
</style>
<script type="text/javascript">
let items = document.querySelectorAll('.carousel .carousel-item')

items.forEach((el) => {
	const minPerSlide = 4
	let next = el.nextElementSibling
	for (var i=1; i<minPerSlide; i++) {
		if (!next) {
    // wrap carousel by using first child
    next = items[0]
}
let cloneChild = next.cloneNode(true)
el.appendChild(cloneChild.children[0])
next = next.nextElementSibling
}
})
</script>
</head>
<body>
<div class="container text-center my-3">
		<div class="row mx-auto my-auto justify-content-center">
			<div id="recipeCarousel" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<div class="col-md-3">
							<div class="card">
								<div class="card-img">
									<img src="https://via.placeholder.com/700x500.png/CB997E/333333?text=1" class="img-fluid">
								</div>
								<div class="card-img-overlay">Slide 1</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="col-md-3">
							<div class="card">
								<div class="card-img">
									<img src="https://via.placeholder.com/700x500.png/DDBEA9/333333?text=2" class="img-fluid">
								</div>
								<div class="card-img-overlay">Slide 2</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="col-md-3">
							<div class="card">
								<div class="card-img">
									<img src="https://via.placeholder.com/700x500.png/FFE8D6/333333?text=3" class="img-fluid">
								</div>
								<div class="card-img-overlay">Slide 3</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="col-md-3">
							<div class="card">
								<div class="card-img">
									<img src="https://via.placeholder.com/700x500.png/B7B7A4/333333?text=4" class="img-fluid">
								</div>
								<div class="card-img-overlay">Slide 4</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="col-md-3">
							<div class="card">
								<div class="card-img">
									<img src="https://via.placeholder.com/700x500.png/A5A58D/333333?text=5" class="img-fluid">
								</div>
								<div class="card-img-overlay">Slide 5</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="col-md-3">
							<div class="card">
								<div class="card-img">
									<img src="https://via.placeholder.com/700x500.png/6B705C/eeeeee?text=6" class="img-fluid">
								</div>
								<div class="card-img-overlay">Slide 6</div>
							</div>
						</div>
					</div>
				</div>
				<a class="carousel-control-prev bg-transparent w-aut" href="#recipeCarousel" role="button" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				</a>
				<a class="carousel-control-next bg-transparent w-aut" href="#recipeCarousel" role="button" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
				</a>
			</div>
		</div>		
	</div>
	
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
</body>
</html>