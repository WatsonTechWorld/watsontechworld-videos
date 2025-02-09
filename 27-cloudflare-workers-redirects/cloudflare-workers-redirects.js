// watsontechworld.com. Code for simple 301 redirects with Cloudflare workers.

addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request))
})

async function handleRequest(request) {
  const url = new URL(request.url);
  const path = url.pathname;

  // Define your redirects here
  const redirects = {
    // user can go to yoursite.com/examplelink1 and get redirected to https://ollama.com/
    '/examplelink1': 'https://ollama.com/',
    // user can go to yoursite.com/reading and get redirected to https://gutenberg.org/
    '/reading': 'https://gutenberg.org/',

    // modify the code under const redirects and above the }; below to add your own links. But keep most of the code the same. You can add as many or as few links as you want.
    // also make sure that you add the correct route and enable the Cloudflare worker correctly for it to work properly.

  };
  // Check if the path exists in the redirects object
  if (redirects[path]) {
    return Response.redirect(redirects[path], 301); // Permanent redirect
  } else {
    // If no redirect is needed, let the request proceed as normal
    return fetch(request);
  }
}
