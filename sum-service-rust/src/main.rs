extern crate hyper;

use std::collections::HashMap;
use hyper::service::{make_service_fn, service_fn};
use hyper::{Body, Method, Request, Response, Server, StatusCode};

async fn echo(req: Request<Body>) -> Result<Response<Body>, hyper::Error> {
    match (req.method(), req.uri().path()) {
        (&Method::GET, "/service/sum") => {

            let params: HashMap<String, String> = req
                .uri()
                .query()
                .map(|v| {
                    url::form_urlencoded::parse(v.as_bytes())
                        .into_owned()
                        .collect()
                })
                .unwrap_or_else(HashMap::new);

            let va = params.get("va").unwrap();
            let vb = params.get("vb").unwrap();   
            let result:f64 = va.parse::<f64>().unwrap() + vb.parse::<f64>().unwrap();
            println!("SUM {:?} {:?} == {:?}",va,vb,result);

            Ok(Response::new(result.to_string().into()))
        }
        _ => {
            let mut not_found = Response::default();
            *not_found.status_mut() = StatusCode::NOT_FOUND;
            Ok(not_found)
        }
    }
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
    let addr = ([0, 0, 0, 0], 3000).into();
    let service = make_service_fn(|_| async { Ok::<_, hyper::Error>(service_fn(echo)) });
    let server = Server::bind(&addr).serve(service);
    println!("Listening on http://{}", addr);
    server.await?;
    Ok(())
}