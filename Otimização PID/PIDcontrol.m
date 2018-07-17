function ft = PIDcontrol(vecKs)
    Kp = vecKs(1);
    Ki = vecKs(2);
    Kd = vecKs(3);

    ft = tf ([Kd Kp Ki],[1 0]);


end
