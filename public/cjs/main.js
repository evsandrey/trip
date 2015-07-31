jQuery(document).ready(function($){
	var timelineBlocks = $('.cd-timeline-block'),
		offset = 0.8;

	//hide timeline blocks which are outside the viewport
	hideBlocks(timelineBlocks, offset);

	//on scolling, show/animate timeline blocks when enter the viewport
	$(window).on('scroll', function(){
			if( $(this).offset().top < $(window).scrollTop()+$(window).height()*0.75 && $(this).find('.cd-timeline-img').is('.is-hidden, .bounce-out') ) {
                    $(this).find('.cd-timeline-img, .cd-timeline-content').removeClass('is-hidden bounce-out').addClass('bounce-in');
            }
			if($(this).offset().top >= $(window).scrollTop()+$(window).height()*0.75 && $(this).find('.cd-timeline-img').is('.bounce-in')) {
				$(this).find('.cd-timeline-img, .cd-timeline-content').removeClass('bounce-in').addClass('bounce-out');   
			} else if($(this).offset().top >= $(window).scrollTop()+$(window).height()*0.80 && $(this).find('.cd-timeline-img').is('.bounce-out')) {
				$(this).find('.cd-timeline-img, .cd-timeline-content').removeClass('bounce-out').addClass('is-hidden'); 
			}
	});

	function hideBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top > $(window).scrollTop()+$(window).height()*offset ) && $(this).find('.cd-timeline-img, .cd-timeline-content').addClass('is-hidden');
		});
	}

	function showBlocks(blocks, offset) {
		blocks.each(function(){
			( $(this).offset().top <= $(window).scrollTop()+$(window).height()*offset && $(this).find('.cd-timeline-img').hasClass('is-hidden') ) && $(this).find('.cd-timeline-img, .cd-timeline-content').removeClass('is-hidden').addClass('bounce-in');
		});
	}
});