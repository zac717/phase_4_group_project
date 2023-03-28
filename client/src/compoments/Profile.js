import React from 'react';
import { Outlet } from 'react-router'
import { Grid } from '@mui/material'

const Profile = () => {
    return (
        <Grid container className='profile-container' justifyContent='stretch'>
          <>
            <Grid item className='profile-menu' xs={12} md={4} lg={3}>
              <h3>USER</h3>
            </Grid>
  
            <Grid
              item
              container
              flexDirection='column'
              spacing={3}
              xs={12}
              md={8}
              lg={9}
              sx={{ p: 4 }}>
              {<Outlet />}
            </Grid>
          </>
      </Grid>

    );
};

export default Profile;