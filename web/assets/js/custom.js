(function() {

    $(window).on('load', function() {

        //preloader code start
        var preloader = $('.loader-overlay');
        if(preloader.length) {
            preloader.fadeOut(1000, function () {
                //$(this).remove();
            });
        }
        //preloader code end

    });

    $(document).ready(function() {
        //scrollspy code start
        var $body = $('body');
        var $navTop = $('#navbar-main');
        var offset = Math.floor($navTop.outerHeight());
        $body.scrollspy({
            target: '#navbar-main',
            offset: offset
        })
        function fixSpy($body, $navTop) {
            var data = $body.data('bs.scrollspy');
            if (data) {
                offset = Math.floor($navTop.outerHeight());
                data.options.offset = offset;
                $body.data('bs.scrollspy', data);
                $body.scrollspy('refresh');
                data.offsets[0] = offset;
            }
        }
        fixSpy($body, $navTop);
        $(window).resize(function() {
            fixSpy($body, $navTop);
        });
        //scrollspy code start
        function appearScroller() {
            if($(window).scrollTop() > 50){
                $("#to-top").addClass("active");
            } else {
                $("#to-top").removeClass("active");
            }
        }
        appearScroller();
        $(window).scroll(function(){
            appearScroller();
        });
        //scrolling to the top code end

        //hero height code start
        function heroHeight() {
            var heroContainerHeight = $("#home").outerHeight();
            var heroHeight = $("#home .table-container-inner").outerHeight();
            if(heroHeight > heroContainerHeight) {
                $(".section-hero").addClass("fluid-content")
            }
            if(heroHeight < heroContainerHeight) {
                $(".section-hero").removeClass("fluid-content")
            }
        }
        heroHeight();
        $(window).resize(function() {
            heroHeight();
        });
        //hero height code end
    });

})();