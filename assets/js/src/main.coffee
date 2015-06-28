'use strict'

$ ->
  el = document.body

  if Uno.is 'device', 'desktop'
    $(document.links).filter ->
      @hostname != window.location.hostname
    .attr 'target', '_blank'

  el.dataset.page ?= Uno.context()
  el.dataset.device ?= Uno.device()
  $(window).on "resize", Uno.device()
  $(window).on "orientationchange", Uno.device()

  Uno.readTime()
  FastClick.attach el unless Uno.is 'device', 'desktop'

  if Uno.is 'page', 'post'
    $('.main').readingTime readingTimeTarget: '.post.reading-time > span'
    $('.content').fitVids()
    postTitle = $('#post-title').text()
    postTitle = postTitle.substring(0, postTitle.length - 1); # delete dot
    shareLink = "http://twitter.com/share?url=" + encodeURIComponent(document.URL)
    shareLink += "&text=" + encodeURIComponent "#{postTitle} »"
    $('#share_twitter').attr('href', shareLink)

  if Uno.is 'page', 'error'
    $('#panic-button').click ->
      s = document.createElement 'script'
      s.setAttribute 'src','http://nthitz.github.io/turndownforwhatjs/tdfw.js'
      document.body.appendChild s

  if Uno.isAbout
    $('#rsabox').bind 'input propertychange', ->
      if $(this).val() == '52 09 6a d5 30'
        window.open 'mailto:mahmutbulut0@gmail.com?subject=Expected Candidate&body=Below are my details and meeting location:'
      return
