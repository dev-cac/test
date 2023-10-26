import { Component, OnInit } from '@angular/core';
import { Model, SurveyNG } from 'survey-angular';

import surveyJson from './survey.json';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.sass']
})
export class AppComponent implements OnInit {
  survey: Model | undefined;
  jsonSurvey: any;

  constructor() {}

  ngOnInit(): void {
    /* this._anyService.getSurvey().subscribe((res) => {
      this.jsonSurvey = res.data;
    }); */

    this.jsonSurvey = surveyJson;

    this.survey = new Model(this.jsonSurvey);
    this.survey.onComplete.add(this.onSurveyComplete);

    SurveyNG.render("surveyElement", { model: this.survey });
  }

  onSurveyComplete = (result: { data: any; }) => {
    console.log(result.data);
  }
}
