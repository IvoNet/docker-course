import { TestBed } from '@angular/core/testing';

import { KwetterService } from './kwetter.service';

describe('KwetterService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: KwetterService = TestBed.get(KwetterService);
    expect(service).toBeTruthy();
  });
});
