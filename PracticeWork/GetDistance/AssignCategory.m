function m_index=AssignCategory(pattern,m_center)

    function result=GetDistance(pattern1,pattern2)
        result=norm(pattern1.feature-pattern2.feature);
    end
    m_index=length(m_center)+1;
    min_distance=Inf;
    for i=1:length(m_center)
        if(min_distance>GetDistance(pattern,m_center(i)))
            min_distance=GetDistance(pattern,m_center(i));
            m_index=i;
        end
    end
end
