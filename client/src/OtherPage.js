import React from 'react';
import { Link } from 'react-router-dom';

export default () => {
    return (
        <div>
            I am some other useless page!
            <Link to='/'>Go back Home</Link>
        </div>
    );
};