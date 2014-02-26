function [S,P,C]=pdffun(varargin)
% PDFFUN Apply a function to a set of probability distributions
%   [S,P,C]=PDFFUN(FUN,VARARGIN) will return the distribution of the
%   function FUN applied to the set of distributions given in VARARGIN
%
%   The output vectors, S, P, and C, are respectively the list of unique
%   outcomes, probability of yielding that outcome, and the total number
%   of ways of obtaining that outcome among all combinations.
%
%   FUN can either be a function handle for an arbitrary function that
%   takes one input argument and returns a scalar value, or one of the
%   following built-in functions:
%
%   Valid for any number of distributions:
%               @plus, @sum, @add     Sum
%               @mean, @average       Average
%               @times                Multiply
%               @max                  Maximum
%               @min                  Minimum
%
%   Valid for only two distributions:
%               @minus                Minus
%               @divide               Divide
%               @power                Power
% 
%   FUN as a user-specified arbitrary function handle is only valid for
%   a single distribution.
%
%   VARARGIN is a list of distributions in the form of
%   (X1,P1,N1,X2,P2,N2,...). Where Xn is the possible events for the n'th
%   distribution, with probability Pn, repeated Nn times. The Nn values
%   are needed if the function is valid for any number of distributions,
%   listed above; otherwise it is not needed and assumed to equal one.
%
%
%   EXAMPLES:
%
%     Valid for any number of distributions
%       Distribution of the maximum value when choosing five values
%       from distribution (A) and three from distribution (B)
%         x1=[-1 0 2];    p1=[.7 .2 .1];     n1=5; %(A)
%         x2=[-4 0 1 2];  p2=[.1 .5 .3 .1];  n2=3; %(B)
%         [S,P,C]=pdffun(@max,x1,p1,n1,x2,p2,n2)
%
%     Valid for only two distributions
%       Difference of two different distributions, A and B
%         x1=[-1 0 2];    p1=[.7 .2 .1];      %(A)
%         x2=[-4 0 1 2];  p2=[.1 .5 .3 .1];   %(B)
%         [S,P,C]=pdffun(@minus,x1,p1,x2,p2)
%       Difference of a distribution with itself
%         x1=[-1 0 2];  p1=[.7 .2 .1];
%         [S,P,C]=pdffun(@minus,x1,p1) 
%
%     User-specified function
%         x1=[-2 -1 0 1];  p1=[.05 .7 .2 .05];
%         [S,P,C]=pdffun(@(x)(x.*(x+1)),x1,p1)    
%
%     Continuous Distributions
%       Note: Program assumes discrete distribution. If using continuous
%       distributions, and using densities as inputs, a normalization must 
%       be made afterwards. Also, as only a finite number of points are
%       used the results are an approximation to the actual value on 
%       a valid domain. 
%
%       Distribution of the minimum of five standard normal distributions.
%       (This example requires the statistics toolbox)
%         x1=linspace(-5,3); y1=normpdf(x1); 
%         [S1,P1,C]=pdffun(@min,x1,y1,5);
%         P1=P1./trapz(S1,P1); %Convert to density
%         plot(S1,P1,x1,y1), grid on
%

%   Mike Sheppard
%   Last Modified: 9-Dec-2011



%Parse the inputs and check for errors
[bsxind,indn,ind2,S,FUN,ALLVEC,ALLPROB,ALLNUMR]=parsepdffun(varargin);

if any(indn)
    %Valid for any number of distributions
    mnind=0; if strcmp(char(FUN),'mean'), FUN=str2func('plus'); mnind=1; end
    P=1; C=1; num=length(ALLVEC);
    for k=1:num
        VEC=ALLVEC{k}; VEC=VEC(:); PROB=ALLPROB{k}; PROB=PROB(:); numr=ALLNUMR{k};
        for n=1:numr
            tempv=bsxfun(FUN,S',VEC);
            tempp=bsxfun(@times,P',PROB);
            tempc=repmat(C',length(VEC),1);
            [S,ign,indx]=unique(tempv(:));
            P=accumarray(indx,tempp(:));
            C=accumarray(indx,tempc(:));
        end
    end
    if mnind, S=S./sum(cell2mat(ALLNUMR)); end 
elseif any(ind2)
    %Valid for only two distributions
    V1=ALLVEC{1}; P1=ALLPROB{1}; V2=ALLVEC{2}; P2=ALLPROB{2};
    tempv=bsxfun(FUN,V1,V2');
    tempp=bsxfun(@times,P1,P2');
    tempc=ones(length(V1),length(V2));
    [S,ign,indx]=unique(tempv(:));
    P=accumarray(indx,tempp(:));
    C=accumarray(indx,tempc(:));
else
    %User defined function
    S=FUN(ALLVEC{:});
    [S,ign,indx]=unique(S(:));
    P=accumarray(indx,ALLPROB{:});
    C=accumarray(indx,ones(1,length(ALLVEC{:})));
end



%Fix round-off errors, grouping like values within error
ind=1;
while ~isempty(ind)
    ind=find(abs(diff(S))<(100*eps));
    if length(ind)>1
        ind=ind(diff(ind)>1);
    end
    C(ind+1)=C(ind+1)+C(ind); P(ind+1)=P(ind+1)+P(ind);
    S(ind)=[]; P(ind)=[]; C(ind)=[];
end

indx=(P==0); S(indx)=[]; P(indx)=[]; C(indx)=[]; %Ignore zero probabilities

end



%FUNCTION TO PARSE THE INPUTS AND CHECK FOR INITIAL ERRORS
function [bsxind,indn,ind2,S,FUN,ALLVEC,ALLPROB,ALLNUMR]=parsepdffun(varargin)

%Get function handle and initial values if needed
varargin=varargin{:};
validstrn={'plus','times','max','min','mean'}; S=[0,1,-Inf,Inf,0];
validstr2={'minus','divide','power'};
%Extract Function
FUN=varargin{1};
if ischar(FUN), FUN=str2func(FUN); end
if ~isa(FUN,'function_handle')
    error('pdffun:Inputs','First input must be a function handle');
end
if any(strcmp(char(FUN),{'add', 'sum'})), FUN=str2func('plus'); end
if strcmp(char(FUN),'average'), FUN=str2func('mean'); end
%Check to see if bsxfun compatible
indn=strcmp(validstrn,char(FUN)); ind2=strcmp(validstr2,char(FUN));
bsxind=any([indn ind2]);
if strcmp(char(FUN),'divide'), FUN=str2func('rdivide'); mnind=1; end
if any(indn), S=S(indn); end %Initial value
%FUN is now a function handle


V=varargin(2:end);
if ~bsxind
    %User-defined function
    if numel(V)~=2
        error('pdffun:Inputs','FUN is only valid for a single distribution');
    else
        ALLVEC={V{1}}; ALLPROB={V{2}}; ALLNUMR={1};
    end
else
    %Built-in functions
    if any(ind2)
        %Allow format of either two or four inputs
        if numel(V)==2
            ALLVEC{1}=V{1}; ALLPROB{1}=V{2}; ALLNUMR{1}=1;
            ALLVEC{2}=V{1}; ALLPROB{2}=V{2}; ALLNUMR{2}=1;
        elseif numel(V)==4
            ALLVEC{1}=V{1}; ALLPROB{1}=V{2}; ALLNUMR{1}=1;
            ALLVEC{2}=V{3}; ALLPROB{2}=V{4}; ALLNUMR{2}=1;
        else
            error('pdffun:Inputs','FUN is only valid for two distributions');
        end
    else
        %Valid for any number of distributions
        ninputs=numel(V); num=ninputs/3;
        if mod(ninputs,3)~=0
            error('pdffun:Inputs','Requires inputs to be in [Values],[Probabilities],[Number] order');
        else
            for k=1:num
                ALLVEC{k}=V{3*k-2}; ALLPROB{k}=V{3*k-1}; ALLNUMR{k}=V{3*k};
            end
        end
    end
end

%error checking on dimensionality of inputs
num=length(ALLVEC);
for k=1:num
    numr=ALLNUMR{k};
    if any(~isfinite(ALLVEC{k}))||any(~isfinite(ALLPROB{k}))
        error('pdffun:Inputs','Requires all input values to be numeric');
    end
    if length(ALLVEC{k})~=length(ALLPROB{k})
        error('pdffun:Inputs','Requires all lengths of input value and probability vector to be equal');
    end
    if any([~isfinite(numr) ~isscalar(numr) numr~=round(numr) numr<=0])
        error('pdffun:Inputs','Requires number of repetitions to be a positive scalar integer');
    end
end

if any(strcmp(char(FUN),{'max', 'min'}))
    for k=1:num
     veck=ALLVEC{k};
        if any(imag(veck(:)))
          S=0; %Change initial setting for complex
        end
    end
end

%Keep only non-zero probabilities
for k=1:num
    tempV=ALLVEC{k}; tempP=ALLPROB{k}; indx=(tempP~=0);
    ALLVEC{k}=tempV(indx); ALLPROB{k}=tempP(indx);
end

end

