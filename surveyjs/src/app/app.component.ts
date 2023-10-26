import { Component, OnInit } from '@angular/core';
import * as Survey from 'survey-angular';

import surveyJson from './survey.json';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.sass']
})
export class AppComponent implements OnInit {
  survey: Survey.Model | undefined;
  jsonSurvey: any;

  constructor() {}

  ngOnInit(): void {
    /* this._anyService.getSurvey().subscribe((res) => {
      this.jsonSurvey = res.data;
    }); */

    this.jsonSurvey = surveyJson;

    this.survey = new Survey.Model(this.jsonSurvey);
    this.survey.onComplete.add(this.onSurveyComplete);

    Survey.SurveyNG.render("surveyElement", { model: this.survey });
  }

  onSurveyComplete = (result: { data: any; }) => {
    console.log(result.data);
  }
}
