import {Injectable} from '@angular/core';
import {Observable} from 'rxjs';
import {Kwetter} from './model/kwetter';
import {map} from "rxjs/operators";
import {HttpClient} from "@angular/common/http";

@Injectable()
export class KwetterService {

  constructor(private http: HttpClient) {
  }

  getKwet(value: string): Observable<Kwetter> {
    return this.http.get('http://localhost:8080/kwetter/rest/api/' + value)
      .pipe(map(data => new Kwetter().deserialize(data)));
  }
}
