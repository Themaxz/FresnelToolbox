Pan1=IncoherentPlenoBL_save(p,L,M,fmin,fmin,fmicro,633,100,500,'y');
save pan1 Pan1;
Pan3=IncoherentPlenoBL_save(pupil,L,M,fmin.*0.95,fmin,fmicro,633,100,500,'y');

save pan3 Pan3;
RAW=Raw1.field+RawO.field;
save Parallax