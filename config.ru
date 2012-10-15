$stdout.sync = true

use Rack::Static,
  :urls => ["/css", "/js", "/img", "/json", "/ico"],
  :root => "."

run lambda { |env|
    content_type = 'text/html'
    if env["REQUEST_URI"] =~ /json$/
        content_type = 'application/json'
    end

  [200,
    {
      'Content-Type'  => content_type,
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open('index.html', File::RDONLY)
  ]
}

