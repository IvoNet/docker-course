# Angular quote service

* ng new quotes --skip-git --verbose
* cd quotes
* ng g class model/quote
* ng g interface model/deserializable
* idea .
* ng serve
* implement deserializable

```typescript
export interface Deserializable<T> {
  deserialize(inout: Object): T;
}
```

* implement Quote

```typescript
import {Deserializable} from './deserializable';

export class Quote implements Deserializable<Quote> {
  public id: string;
  public quote: string;
  public author: string;

  deserialize(input): Quote {
    this.id = input.id;
    this.quote = input.quote;
    this.author = input.author;
    return this;
  }
}
```

* implement QuoteService (end-point: http://localhost:8080/back-end/rest/quote/)

```typescript
import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs/Observable';
import {Quote} from '../model/quote';
import 'rxjs/add/operator/map';

@Injectable()
export class QuoteService {

  constructor(private http: HttpClient) {
  }

  getQuote(value: string): Observable<Quote> {
    return this.http.get('http://localhost:8080/back-end/rest/quote/' + value)
      .map(data => new Quote().deserialize(data));
  }
}
``` 

* app.component.html

```html
<div>
    <input type="text" value="{{search}}" #query/>
    <button type="submit" (click)="getQuote(query.value)">Quote</button>
</div>
<h2>{{quote.quote}}</h2>
```

* app.component.ts

```typescript
import {Component} from '@angular/core';
import {Quote} from './model/quote';
import {QuoteService} from './services/quote.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  providers: [QuoteService]
})
export class AppComponent {
  search = '1';
  quote: Quote = new Quote();

  constructor(private quoteService: QuoteService) {

  }

  getQuote(value: string) {
    this.quoteService.getQuote(value).subscribe(data => this.quote = data, error => console.log(error));
  }
}
```

* `pm run build` (creates dist folder)
* create Dockerfile

```dockerfile
FROM localhost:5000/python
WORKDIR /app
COPY dist ./
VOLUME /app
EXPOSE 8000
ENTRYPOINT ["python", "/usr/local/lib/python2.7/SimpleHTTPServer.py"]
```

* `docker build -t localhost:5000/quotes`
* `docker push` (only if you want to commit to registry)
* `docker run -it --rm -p 8000:8000 -v $(pwd)/dist:/app localhost:5000/quotes`