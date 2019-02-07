#### Link and URL to refer:
Read below to convert into image bytes

    https://medium.com/@tmlabonte/serving-image-based-deep-learning-models-with-tensorflow-servings-restful-api-d365c16a7dc4

Proper Use of Tensorflow serving

    https://stackoverflow.com/questions/42519010/how-to-do-batching-in-tensorflow-serving

Keras to tf-Serving

    https://blog.deeppoint.ai/deployment-keras-model-into-tensorflow-serving-with-gpu-e3137b8c8bfb

#### To run mnist with tensorflow-serving docker [this works]

    docker run -p 8500:8500 \
    --mount type=bind,source=/tmp/mnist,target=/models/mnist \
    -e MODEL_NAME=mnist -t tensorflow/serving &

    and then run the python file,


#### To run building clasification with tensorflow-serving docker [this works]
    
    docker run -p 8500:8500 \
    --mount type=bind,source=/Users/sardhendu/app/dataset/deployment/MODEL_NAME,\
    target=/models/MODEL_NAME -e MODEL_NAME=MODEL_NAME -t tensorflow/serving &

 and then run the python file,

  `project_name/classifier.py`


#### Build with Kubernetees

##### Environments:
1. Preview
2. Staging
3. Production

##### TF-Service": Jenkins File
1. (jx-init branch) First we create the docker image to the preview environment. Make the docker registry.
2. Deploy the application to preview.
3. When everything work fine, we merge the jx-init to the master branch
4. (master branch) We build the docker image in the staging environment, with the docker registry.
5. Deploy the application to the staging.

##### Kubernetees: ./charts/building-classify-model-api/templates
1. deployment.yaml: Handles the deployment of the service in the Kubernetees cluster.
2. services.yaml: Exposes the deployed service for applcations within the cluster.
3. ingress_default.yaml/ingress_custom.yaml: Exposes the service to the application running outside the cluster.
4. values.yaml: Defines the resources that the service would need in the Kuberneetes cluster.
