function m_center_i=CalCenter(m_center_i,m_pattern,patternNum)
if nargin==2
    patternNum=length(m_pattern);
end
a=0;
temp=zeros(8,1);
for i=1:patternNum
    if(m_pattern(i).category==m_center_i.index)
        a=a+1;
        temp=temp+m_pattern(i).feature;
    end
end
m_center_i.patternNum=a;
if(a~=0)
    m_center_i.feature=temp/a;
else
    m_center_i.feature=temp;
end
end
        