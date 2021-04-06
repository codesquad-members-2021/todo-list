import React, {useState, useEffect} from "react";
import TestTemplate from "../../components/Test/TestTemplate";


const TestContainer = (props) => {
    const [count, setCount] = useState(1);

    useEffect(() => {
        document.title = `테스트중 ${count}`
    }, [count]);

    const onClick = () => setCount(count + 1);

    return (
        <TestTemplate
            onClick = {onClick}
            count = {count}
        />
    );
};


export default TestContainer;