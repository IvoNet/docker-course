import {Component} from '@angular/core';
import {Kwetter} from "./model/kwetter";
import {KwetterService} from "./kwetter.service";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
  providers: [KwetterService]
})
export class AppComponent {
  search = '1';
  kwetter: Kwetter = new Kwetter();

  constructor(private kwetterService: KwetterService) {

  }

  getKwetter(value: string) {
    this.kwetterService.getKwet(value).subscribe(data => this.kwetter = data, error => console.log(error));
  }
}
