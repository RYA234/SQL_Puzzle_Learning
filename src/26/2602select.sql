SELECT DISTINCT diagram_name,bubble_name,flow_name
 FROM (SELECT F1.diagram_name,F1.bubble_name,F2.flow_name
        FROM DataFlowDiagrams AS F1
        CROSS JOIN
        DataFlowDiagrams AS F2
        WHERE F2.flow_name NOT IN
                (SELECT F3.flow_name
                     FROM DataFlowDiagrams AS F3
                WHERE F3.diagram_name = F1.diagram_name
                AND F3.bubble_name = F1.bubble_name)) AS TMP
    ORDER BY diagram_name, bubble_name,flow_name;