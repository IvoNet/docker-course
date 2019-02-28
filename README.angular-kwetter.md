# Angular quote service

* `docker run -it --rm --name node11 -v "$(pwd):/project" -p 4000:3000 ivonet/node:11`
* `ng new kwetter-fe --skip-git --verbose`
* `cd kwetter-fe`
* `ng g class model/kwetter`
* `ng g interface model/deserializable`
* `ng serve`
* implement deserializable

```typescript
export interface Deserializable<T> {
  deserialize(inout: Object): T;
}
```

* implement Kwetter

```typescript
import {Deserializable} from './deserializable';

export class Kwetter implements Deserializable<Kwetter> {
  public id: string;
  public name: string;
  public message: string;

  deserialize(input): Kwetter {
    this.id = input.id;
    this.name = input.name;
    this.message = input.message;
    return this;
  }
}
```

* implement KwetterService (end-point: http://localhost:8080/back-end/rest/api/)

```typescript
import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs/Observable';
import {Quote} from '../model/kwetter';
import 'rxjs/add/operator/map';

@Injectable()
export class QuoteService {

  constructor(private http: HttpClient) {
  }

  getKwet(value: string): Observable<Kwetter> {
    return this.http.get('http://localhost:8080/kwetter/rest/api/' + value)
      .map(data => new Kwetter().deserialize(data));
  }
}
``` 

* app.component.html

```html
<div>
    <input type="text" value="{{search}}" #query/>
    <button type="submit" (click)="getKwet(query.value)">Kwet</button>
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

* `npm run build` (creates dist folder)
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