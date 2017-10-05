import './vendor.ts';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { Ng2Webstorage } from 'ng2-webstorage';

import { MinhaLojaEzopsSharedModule, UserRouteAccessService } from './shared';
import { MinhaLojaEzopsHomeModule } from './home/home.module';
import { MinhaLojaEzopsAdminModule } from './admin/admin.module';
import { MinhaLojaEzopsAccountModule } from './account/account.module';
import { MinhaLojaEzopsEntityModule } from './entities/entity.module';

import { customHttpProvider } from './blocks/interceptor/http.provider';
import { PaginationConfig } from './blocks/config/uib-pagination.config';

// jhipster-needle-angular-add-module-import JHipster will add new module here

import {
    JhiMainComponent,
    LayoutRoutingModule,
    NavbarComponent,
    FooterComponent,
    ProfileService,
    PageRibbonComponent,
    ActiveMenuDirective,
    ErrorComponent
} from './layouts';

@NgModule({
    imports: [
        BrowserModule,
        LayoutRoutingModule,
        Ng2Webstorage.forRoot({ prefix: 'jhi', separator: '-'}),
        MinhaLojaEzopsSharedModule,
        MinhaLojaEzopsHomeModule,
        MinhaLojaEzopsAdminModule,
        MinhaLojaEzopsAccountModule,
        MinhaLojaEzopsEntityModule,
        // jhipster-needle-angular-add-module JHipster will add new module here
    ],
    declarations: [
        JhiMainComponent,
        NavbarComponent,
        ErrorComponent,
        PageRibbonComponent,
        ActiveMenuDirective,
        FooterComponent
    ],
    providers: [
        ProfileService,
        customHttpProvider(),
        PaginationConfig,
        UserRouteAccessService
    ],
    bootstrap: [ JhiMainComponent ]
})
export class MinhaLojaEzopsAppModule {}
