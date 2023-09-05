/*!
    * Start Bootstrap - Agency v6.0.3 (https://startbootstrap.com/theme/agency)
    * Copyright 2013-2020 Start Bootstrap
    * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-agency/blob/master/LICENSE)
    */
    (function ($) {
    "use strict"; // Start of use strict

    // Smooth scrolling using jQuery easing
    $('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function () {
        if (
            location.pathname.replace(/^\//, "") ==
                this.pathname.replace(/^\//, "") &&
            location.hostname == this.hostname
        ) {
            var target = $(this.hash);
            target = target.length
                ? target
                : $("[name=" + this.hash.slice(1) + "]");
            if (target.length) {
                $("html, body").animate(
                    {
                        scrollTop: target.offset().top - 72,
                    },
                    1000,
                    "easeInOutExpo"
                );
                return false;
            }
        }
    });

    // Closes responsive menu when a scroll trigger link is clicked
    $(".js-scroll-trigger").click(function () {
        $(".navbar-collapse").collapse("hide");
    });

    // Activate scrollspy to add active class to navbar items on scroll
    $("body").scrollspy({
        target: "#mainNav",
        offset: 74,
    });

    // Collapse Navbar
    var navbarCollapse = function () {
        if ($("#mainNav").offset().top > 100) {
            $("#mainNav").addClass("navbar-shrink");
        } else {
            $("#mainNav").removeClass("navbar-shrink");
        }
    };
    // Collapse now if page is not at top
    navbarCollapse();
    // Collapse the navbar when page is scrolled
    $(window).scroll(navbarCollapse);
}) // End of use strict

// Remplacer l'URL par l'URL de l'API Sea Shepherd
const apiUrl = 'https://api.seashepherdnews.com/latest';

// Fonction pour récupérer les données de l'API
async function fetchSeaShepherdNews() {
    try {
        const response = await fetch(apiUrl);
        const data = await response.json();

        // Parcourir les données et afficher les nouvelles
        const newsList = document.getElementById('newsList');
        data.forEach(news => {
            const listItem = document.createElement('li');
            listItem.innerHTML = `<a href="${news.link}" target="_blank">${news.title}</a>`;
            newsList.appendChild(listItem);
        });
    } catch (error) {
        console.error('Une erreur s\'est produite lors de la récupération des nouvelles :', error);
    }
}

// Appeler la fonction pour récupérer les nouvelles au chargement de la page
fetchSeaShepherdNews();
